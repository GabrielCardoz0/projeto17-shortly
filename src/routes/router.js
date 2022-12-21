import { Router } from "express";
import getUrlsIdController from "../controllers/getUrlsId.controller.js";
import signInCcontroller from "../controllers/signIn.controller.js";
import signUpController from "../controllers/signUp.controller.js";
import urlShortenController from "../controllers/urlShorten.controller.js";
import bearerAuthenticationMiddleware from "../middlewares/bearerAuthentication.middleware.js";

const router = Router();

router.post("/signup", signUpController);

router.post("/signin" , signInCcontroller);

router.post("/urls/shorten", bearerAuthenticationMiddleware, urlShortenController);

router.get("/urls/:id", getUrlsIdController);

export default router;