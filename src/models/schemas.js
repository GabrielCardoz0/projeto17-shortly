import Joi from "joi";

export const newUserSchema = Joi.object({
    name: Joi.string().min(2).required(),
    email:Joi.string().email({minDomainSegments:2, tlds:{allow:['com','net']}}).required(),
    password: Joi.string().required(),
    confirmPassword: Joi.string().required()
});

export const userSchema = Joi.object({
    email:Joi.string().email({minDomainSegments:2, tlds:{allow:['com','net']}}).required(),
    password: Joi.string().required()
});

export const urlSchema = Joi.object({
    url: Joi.string().required()
});
