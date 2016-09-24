/*eslint-env node */

module.exports = {
  config: {
    server: {
      port: 3000
    },
    files: {
      javascripts: {
        joinTo: "app.js"
      },
      stylesheets: {
        joinTo: "app.css"
      }
    },
    plugins: {
      elmBrunch: {
        mainModules: ["app/Bingo.elm", "app/BingoUtils.elm"]
      }
    }
  }
};
