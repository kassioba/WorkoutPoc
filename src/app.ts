import express, { Request, Response } from "express"
import cors from "cors"
import httpStatus from "http-status"
import workoutRouter from "./routers/workout.router"

const app = express()

app.use(cors())
app.use(express.json())
app.use(workoutRouter)

app.get('/health', (req: Request, res: Response) => res.sendStatus(httpStatus.OK))

const port = 5000

app.listen(port, () => console.log(`Server running on port ${port}`))
