const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const employeesSchema = new Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    lastName: {
        type: String,
        required: true,
        trim: true
    },
    socialId: {
        type: Number,
        required: true,
    },
    gender: {
        type: String,
        defult: "male",
    },
    birthDate: {
        type: Object,
        required: true
    },
    manager: {
        type: Boolean,
        required: true,
    },
    CreatedAt: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('employees', employeesSchema);