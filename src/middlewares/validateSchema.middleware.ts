import { NextFunction, Request, Response } from 'express'
import Joi from 'joi'
import httpStatus from "http-status"

function validateSchema(schema: Joi.ObjectSchema){
    return (req: Request, res: Response, next: NextFunction) =>{
        const validation = schema.validate(req.body, {abortEarly: false})

        if(validation.error) return res.status(httpStatus.BAD_REQUEST).send(validation.error.message)

        next()
    }
}

export default validateSchema