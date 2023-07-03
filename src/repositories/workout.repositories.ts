import db from "../database/database.connection";
import { Workout } from "protocols";
import { v4 as uuid } from "uuid"

export async function getWorkouts(){
    const allWorkouts = await db.query(`
    SELECT * FROM "muscleGroup" 
    JOIN exercises
    ON exercises.identification = "muscleGroup"."exercisesIdentification"
    `)
    
    return allWorkouts.rows
}

export async function insertWorkout(workout: Workout){
    const identification = uuid()


    await db.query(`INSERT INTO "muscleGroup" ("muscleGroup", "exercisesIdentification") VALUES ($1, '${identification}')`, [workout.muscleGroup])

    workout.exercises.forEach(exercise =>
        db.query(`
        INSERT INTO exercises (name, sets, reps, rest, identification) VALUES ($1, $2, $3, $4, '${identification}')`, 
        [exercise.name, exercise.sets, exercise.reps, exercise.rest])
    )
}

export async function getWorkoutsByMuscleGroup(muscleGroup: string){
    const muscleGroupFormat = muscleGroup[0].toUpperCase() + muscleGroup.slice(1).toLowerCase()
    
    const workouts = (await (db.query(`
    SELECT * FROM "muscleGroup" 
    JOIN exercises
    ON exercises.identification = "muscleGroup"."exercisesIdentification"
    WHERE "muscleGroup" = $1
    `, [muscleGroupFormat]))).rows

    return workouts
}