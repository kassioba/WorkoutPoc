export type Workout = {
    muscleGroup: string,
    exercises: Exercise[]
}

export type Exercise = {
    name: string,
    sets: number,
    reps: number,
    rest: number,
    identification?: string
}