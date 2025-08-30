db = db.getSiblingDB("fintree");

db.createRole({
  role: "insertOnly",
  privileges: [
    {
      resource: { db: "fintree", collection: "" }, // "" means all collections
      actions: ["insert"], // only write operations
    },
  ],
  roles: [], // no inherited roles
});

db.createUser({
  user: "${FINTREE_SCRAPER_USERNAME}",
  pwd: "${FINTREE_SCRAPER_PASSWORD}",
  roles: [{ role: "insertOnly", db: "fintree" }],
});

db.createUser({
  user: "${FINTREE_ANALYSER_USERNAME}",
  pwd: "${FINTREE_ANALYSER_PASSWORD}",
  roles: [{ role: "read", db: "fintree" }],
})
