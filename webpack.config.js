const path = require("path");

const toPath = relativePath => path.resolve(__dirname, relativePath);

module.exports = (env, argv) => {
  const isDev = argv.mode === "development";

  console.info(isDev ? "development build" : "production build");

  return {
    entry: {
      minecraft: "./src/Minecraft/index.ts"
    },

    output: {
      filename: "[name]/index.js",
      path: toPath("./build")
    },

    resolve: {
      extensions: [".js", ".ts", ".elm"]
    },

    module: {
      rules: [
        {
          test: /\.ts$/,
          use: {
            loader: "ts-loader"
          }
        },

        {
          test: /\.html$/,
          exclude: /node_modules/,
          loader: "file-loader",
          options: {
            name: file =>
              file
                .split(/[\\/]/)
                .slice(-2)
                .join("/")
                .toLowerCase()
          }
        },

        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader: "elm-webpack-loader",
          options: {
            debug: isDev,
            warn: true,
            verbose: isDev
          }
        }
      ]
    },

    devServer: {
      host: "0.0.0.0",
      disableHostCheck: true
    }
  };
};
