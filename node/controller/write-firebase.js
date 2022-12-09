var admin = require("firebase-admin");
var serviceAccount = require("../firebase/country-bf992-firebase-adminsdk-44fss-67715d13d6.json");

module.exports = {
  write: async function (dataCSV) {
    admin.initializeApp({
      credential: admin.credential.cert(serviceAccount),
    });

    const db = admin.firestore();

    dataCSV.forEach(async (country) => {
      await db.collection("country").doc(country.country).set({
        name: country.country,
      });

      await db
        .collection("country")
        .doc(country.country)
        .collection("subcountry")
        .doc(country.subcountry)
        .set({
          name: country.subcountry,
        });

      await db
        .collection("country")
        .doc(country.country)
        .collection("subcountry")
        .doc(country.subcountry)
        .collection("city")
        .doc(country.name)
        .set({
          name: country.name,
          subcountry: country.subcountry,
          geonameid: country.geonameid,
        });

      console.log(
        `migration ${country.name} - ${country.subcountry} - ${country.country}`
      );
    });
  },
};
