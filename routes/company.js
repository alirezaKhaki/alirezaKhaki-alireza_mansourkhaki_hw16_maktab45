const express = require('express')
const router = express.Router()
const Company = require('../models/company');
const path = require('path');
router.get('/companiesPage', (req, res) => {
    Company.find({}, (err, companies) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.render(path.join(__dirname, '../views', './index.ejs'), { companies })
    });
});

router.get('/all', (req, res) => {
    Company.find({}, (err, companies) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(companies);
    });
});


router.get('/age/:id', (req, res) => {
    const year = Number(req.params.id)
    const date = new Date();
    const yearNow = date.getFullYear();
    const yearToCalculate = yearNow - year

    Company.find({ dateOfCreation: { $gt: `${yearToCalculate}` } }, (err, companies) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(companies);
    });
});


router.get('/:id', (req, res) => {
    Company.findOne({ _id: req.params.id }, (err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :))", err: err.message });
        res.json(company);
    })
});

router.put('/', (req, res) => {


    const newCompany = new Company({
        name: req.body.name,
        creatId: req.body.creatId,
        number: req.body.number,
        city: req.body.city,
        province: req.body.province,
        dateOfCreation: req.body.dateOfCreation,
        number: req.body.number
    });


    newCompany.save((err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json(company);
    })
});


router.post('/:id', (req, res) => {
    if (req.params.id === "changeAll") {
        const city = req.body.city

        Company.updateMany(({}, { $set: { city: `${city}`, province: `${city}` } }), (err, company) => {
            if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
            res.json({ company, msg: "success" });
        })
    } else {
        Company.findOneAndUpdate({ _id: req.params.id }, req.body, { new: true }, (err, company) => {
            if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
            res.json(company);
        })
    }
});


router.delete('/:id', (req, res) => {
    Company.findOneAndDelete({ _id: req.params.id }, (err, company) => {
        if (err) return res.status(500).json({ msg: "Server Error :)", err: err.message });
        res.json({ company, msg: "success" });
    })
});


module.exports = router