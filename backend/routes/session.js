const express = require("express");
const router = express.Router();
const Session = require("../models/session.model");
const middleware = require("../middleware");


router.route("/AddSession").post((req, res) => {
  const session = Session({
    username: req.body.username,
    title: req.body.title,
    description: req.body.description,
    members: req.body.members,
  });

  session
    .save()
    .then((result) => {
      res.json({ data: result["_id"] });
    })
    .catch((err) => {
      console.log(err), res.json({ err: err });
    });
});
router.route("/getAllSession").get( (req, res) => {
  Session.find( (err, result) => {
    if (err) return res.json(err);
    return res.json({ data: result });
  });
});
router.route("/getSession").get((req, res) => {
  Session.find({ username: req.body.username }, (err, result) => {
    if (err) return res.json(err);
    return res.json({ data: result });
  });
});

router.route("/deleteSession/:id").delete((req, res) => {
  Session.findOneAndDelete(
    {
      $and: [{ _id: req.params.id }],
    },
    (err, result) => {
      if (err) return res.json(err);
      else if (result) {
        console.log(result);
        return res.json("Session deleted");
      }
      return res.json("Session not deleted");
    }
  );
});

module.exports = router;
