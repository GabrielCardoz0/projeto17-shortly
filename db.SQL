CREATE TABLE "users" (
	"id" serial NOT NULL,
	"username" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
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
	"url" TEXT NOT NULL,
	"shortUrl" TEXT NOT NULL,
	"userId" INTEGER NOT NULL,
	"acesses" INTEGER NOT NULL DEFAULT 0,
	CONSTRAINT "urls_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "tokens" ADD CONSTRAINT "tokens_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "urls" ADD CONSTRAINT "urls_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE users ADD COLUMN "createdAt" TIMESTAMP NOT NULL DEFAULT NOW();

ALTER TABLE tokens ADD COLUMN "createdAt" TIMESTAMP NOT NULL DEFAULT NOW();

ALTER TABLE urls ADD COLUMN "createdAt" TIMESTAMP NOT NULL DEFAULT NOW();