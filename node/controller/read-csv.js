var fs = require("fs");
const { parse } = require("csv-parse");
const path = require("path");
const writeFB = require("./write-firebase");

module.exports = {
  readCSV: function () {
    var parser = parse({ columns: true }, function (err, records) {
      writeFB.write(records);
    });

    fs.createReadStream(
      path.join(__dirname, "..", "/data/world-cities.csv")
    ).pipe(parser);
  },
};
