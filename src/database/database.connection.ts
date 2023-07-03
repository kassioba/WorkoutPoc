import pg from "pg"

const { Pool } = pg

const db = new Pool({
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: '99731503Aa@',
    database: 'poc_1'
})

export default db