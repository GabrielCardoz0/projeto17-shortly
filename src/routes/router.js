import { Router } from "express";
import signInCcontroller from "../controllers/signIn.controller.js";
import signUpController from "../controllers/signUp.controller.js";

const router = Router();

router.post("/signup", signUpController);

router.post("/signin" , signInCcontroller);

export default router;