import validateSchema from "../middlewares/validateSchema.middleware"
import { createWorkout, getWorkout, getWorkoutByMuscleGroup } from "../controllers/workout.controllers"
import Router from "express"
import workoutSchema from "../schemas/workout.schema"

const workoutRouter = Router()

workoutRouter.get('/workout', getWorkout)
workoutRouter.get('/workout/:group', getWorkoutByMuscleGroup)
workoutRouter.post('/workout', validateSchema(workoutSchema), createWorkout)

export default workoutRouter