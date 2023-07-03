# WorkoutPoc

Uma API em que é possível publicar treinos, buscar todos os treinos ou filtrá-los por agrupamento muscular.

## Rotas

POST: /workout
Body: { 
  "muscleGroup": "string", 
  "exercises": [
    { 
      "name": "Tríceps Corda Polia", 
      "sets": 3, 
      "reps": 10, 
      "rest": 90 
    }, 
    { 
      "name": 
      "Paralela", 
      "sets": 3, 
      "reps": 10, 
      "rest": 90 
    }
  ] 
}

GET: /workout 
> Busca todos os treinos

GET: /workout/:group 
> Busca treinos de determinado agrupamento muscular
