const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const CompanySchema = new Schema({
    name: {
        type: String,
        required: true,
        trim: true,
        minlength: 2,
        maxlength: 30
    },
    creatId: {
        type: Number,
        required: true,
    },
    city: {
        type: String,
        trim: true
    },
    province: {
        type: String,
        trim: true
    },
    number: {
        type: number,
    },
    dateOfCreation: {
        type: Date
    },
    CreatedAt: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Company', CompanySchema);