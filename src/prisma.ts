import "dotenv/config";
import { PrismaMariaDb } from "@prisma/adapter-mariadb";
import { PrismaClient } from "../generated/prisma/client.ts";

const connectionString = process.env.DATABASE_URL;
if (!connectionString) {
  throw new Error("DATABASE_URL não definida. Copie .env.example para .env.");
}

const adapter = new PrismaMariaDb(connectionString);

export const prisma = new PrismaClient({ adapter });
