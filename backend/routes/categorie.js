const express = require("express");
const router = express.Router();
const Category = require("../models/categorie.model");
const middleware = require("../middleware");


router.route("/AddCategory").post((req, res) => {
  const category = Category({
    title: req.body.title,
  });

  category
    .save()
    .then((result) => {
      res.json({ data: result["_id"] });
    })
    .catch((err) => {
      console.log(err), res.json({ err: err });
    });
});

router.route("/getCategory").get( (req, res) => {
  Category.find((err, result) => {
    if (err) return res.json(err);
    return res.json({ data: result });
  });
});

router.route("/deleteCategory/:title").delete( (req, res) => {
  Category.findOneAndDelete({ title: req.params.title }, (err, result) => {
      if (err) return res.json(err);
      else if (result) {
        console.log(result);
        return res.json("Category deleted");
      }
      return res.json("Category not deleted");
    }
  );
});

module.exports = router;
