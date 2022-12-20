CREATE TABLE "users" (
	"id" serial NOT NULL,
	"username" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" varchar(100) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "tokens" (
	"id" serial NOT NULL,
	"token" TEXT NOT NULL UNIQUE,
	"userId" integer NOT NULL,
	CONSTRAINT "tokens_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "urls" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL UNIQUE,
	"shortUrl" TEXT NOT NULL,
	"userId" integer NOT NULL,
	"acesses" integer NOT NULL,
	CONSTRAINT "urls_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "tokens" ADD CONSTRAINT "tokens_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "urls" ADD CONSTRAINT "urls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");