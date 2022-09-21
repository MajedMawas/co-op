const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    mode: 'develpopment',
    entry: path.resolve(__dirname, 'src', 'index.tsx'),
    output: {
        path: path.resolve(__dirname, 'src'),
        publicPath: 'http://localhost:8060/src',
        filename: 'bundle.js'
    },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                excludes: /node_module/,
                loader: 'ts-loader'
            },
            {
              test: /\. (jpg|jpeg|gif|eot|otf|webp|mp4|webm|wav|mp3|m4a|aac|oga|ico|svg|woff|woff2|png|ttf)$/,
              use: [{
                loader:'file-loader'
              }]  
            }
        ]
    
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: path.resolve(__dirname, 'src', 'index.html')
        })
    ]
}