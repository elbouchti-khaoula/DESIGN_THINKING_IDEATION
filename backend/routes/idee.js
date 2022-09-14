const express = require("express");
const router = express.Router();
const Idee = require("../models/idee.model");

router.route("/AddIdee").post((req, res) => {
  const idee = Idee({
    username: req.body.username,
    idProject : req.body.idProject,
    number:req.body.number,
    title: req.body.title,
    description: req.body.description,
    
  });
  idee
    .save()
    .then((result) => {
      res.json({ data: result["_id"] });
    })
    .catch((err) => {
      console.log(err), res.json({ err: err });
    });
});

router.route("/getMemberIdee").get( (req, res) => {
  Idee.find({ username: req.body.username }, (err, result) => {
    if (err) return res.json(err);
    return res.json({ data: result });
  });
});
router.route("/getAllIdee/:idProject").get( (req, res) => {
  Idee.find({ idProject: req.params.idProject }, (err, result) => {
    if (err) return res.json(err);
    return res.json({ data: result });
  });
});
//router.route("/deleteIdee/:id ").delete( (req, res) => {
router.route("/deleteIdee/:id").delete( (req, res) => {
  Idee.findOneAndDelete(
    {_id:req.params.id},
   
    (err, result) => {
      if (err) return res.json(err);
      else if (result) {
        console.log(result);
        return res.json("Idee deleted");
      }
      return res.json("Idee not deleted");
    }
  );
});

router.route("/update/:username/:number").post((req, res) => {
  let idee = {};
  Idee.findOneAndUpdate(
    {number:req.params.number},
    { $set: { 
      number: req.body.number ? req.body.number : idee.number,
      title: req.body.title ? req.body.title : idee.title,
      description: req.body.description ? req.body.description : idee.description
      } },
    { new: true },
    (err, result) => {
      if (err) return res.json(err);
      else if (result) {
        console.log(result);
        return res.json("Idee updated");
      }
      return res.json("Idee not updated");
    }
  );
}),

router.route("/updateCategory/:username/:number").post((req, res) => {
  let idee = {};
  Idee.findOneAndUpdate(
    {number:req.params.number},
    { $set: { 
      number: req.body.number ? req.body.number : idee.number,
      categorie: req.body.categorie ? req.body.categorie : idee.categorie,
      } },
    { new: true },
    (err, result) => {
      if (err) return res.json(err);
      else if (result) {
        console.log(result);
        return res.json("updated");
      }
      return res.json("not updated");
    }
  );
});
module.exports = router;
