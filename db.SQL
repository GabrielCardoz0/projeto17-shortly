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
	"token" varchar(200) NOT NULL UNIQUE,
	"userId" integer NOT NULL UNIQUE,
	CONSTRAINT "tokens_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "urls" (
	"id" serial NOT NULL,
	"url" varchar(255) NOT NULL UNIQUE,
	"shortUrl" varchar(255) NOT NULL,
	"userId" integer NOT NULL UNIQUE,
	"acesses" integer NOT NULL,
	CONSTRAINT "urls_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "tokens" ADD CONSTRAINT "tokens_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "urls" ADD CONSTRAINT "urls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");