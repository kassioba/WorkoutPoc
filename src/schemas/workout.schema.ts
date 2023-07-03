import Joi from "joi";
import { Workout } from "protocols";

const workoutSchema = Joi.object<Workout>({
    muscleGroup: Joi.string().required(),
    exercises: Joi.array().items(Joi.object({
        name: Joi.string().required(),
        sets: Joi.number().required(),
        reps: Joi.number().required(),
        rest: Joi.number().required(),
    }))
})

export default workoutSchema