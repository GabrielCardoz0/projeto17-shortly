import { Router } from "express";
import signUpController from "../controllers/signUp.controller.js";

const router = Router();

router.post("/signup", signUpController);


export default router;