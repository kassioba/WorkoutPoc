import { Request, Response } from "express";
import httpStatus from "http-status"
import { filterWorkoutByMuscleGroup, getAllWorkouts, sendNewWorkoutToDB } from "../services/workout.services";
import { Workout } from "protocols";

export async function getWorkout(req: Request, res: Response){
    const workouts = await getAllWorkouts()

    res.send(workouts)
}

export async function getWorkoutByMuscleGroup(req: Request, res: Response){
    const muscleGroup = req.params.group

    const response = await filterWorkoutByMuscleGroup(muscleGroup)

    if(response.length === 0) return res.status(httpStatus.NOT_FOUND).send('Grupo muscular não encontrado')

    return res.send(response)
}

export async function createWorkout(req: Request, res: Response){
    const workout = req.body as Workout
    try{
        await sendNewWorkoutToDB(workout)
    }catch(err){
        res.status(httpStatus.INTERNAL_SERVER_ERROR).send(err.message)
    }

    res.sendStatus(httpStatus.CREATED)
}