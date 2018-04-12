const path = require("path");

const toPath = relativePath => path.resolve(__dirname, relativePath);

module.exports = (env, argv) => {
  const isDev = argv.mode === "development";

  return {
    entry: {
      main: "./src/index.ts"
    },

    output: {
      filename: "[name].js",
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
            name: "[name].[ext]"
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
    }
  };
};
