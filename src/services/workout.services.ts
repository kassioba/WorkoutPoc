import { Workout } from "protocols"
import { getWorkouts, insertWorkout, getWorkoutsByMuscleGroup } from "../repositories/workout.repositories"

export async function filterWorkoutByMuscleGroup(muscleGroup: string){
    const workouts = await getWorkoutsByMuscleGroup(muscleGroup)
    
    const response = formatResponse(workouts)

    response.forEach(workout => {
        workout.exercises.forEach(exercise => delete exercise.identification)
    })
    
    return response
}

export async function getAllWorkouts(){
    const workouts = await getWorkouts()

    const response = formatResponse(workouts)

    response.forEach(workout => {
        workout.exercises.forEach(exercise => delete exercise.identification)
    })

    return response
}

export async function sendNewWorkoutToDB(workout: Workout){
    await insertWorkout(workout)
}


function formatResponse(workouts: any){
    const formatWorkout: Workout[] = []

    let exercises = []
    let identification: string;
    let muscleGroupCopy: string;

    for(let i = 0; i < workouts.length; i++){
            if((identification === workouts[i].identification || i === 0) && i !== workouts.length - 1){
                muscleGroupCopy = workouts[i].muscleGroup.slice()
                
                delete workouts[i].id
                delete workouts[i].muscleGroup
                delete workouts[i].exercisesIdentification
                exercises.push(workouts[i])
            }else if(i === workouts.length - 1 && identification === workouts[i].identification){
                delete workouts[i].id
                delete workouts[i].muscleGroup
                delete workouts[i].exercisesIdentification
                exercises.push(workouts[i])

                formatWorkout.push({
                    muscleGroup: muscleGroupCopy,
                    exercises
                })

            }else if(i === workouts.length - 1 && identification !== workouts[i].identification){
                formatWorkout.push({
                    muscleGroup: muscleGroupCopy,
                    exercises
                })

                muscleGroupCopy = workouts[i].muscleGroup.slice()

                exercises = []

                delete workouts[i].id
                delete workouts[i].muscleGroup
                delete workouts[i].exercisesIdentification
                exercises.push(workouts[i])

                formatWorkout.push({
                    muscleGroup: muscleGroupCopy,
                    exercises
                })

            }else if(identification !== workouts[i].identification){
                formatWorkout.push({
                    muscleGroup: muscleGroupCopy,
                    exercises
                })

                muscleGroupCopy = workouts[i].muscleGroup.slice()

                exercises = []

                delete workouts[i].id
                delete workouts[i].muscleGroup
                delete workouts[i].exercisesIdentification
                exercises.push(workouts[i])
            }
        
        identification = workouts[i].identification
    }

    return formatWorkout
}