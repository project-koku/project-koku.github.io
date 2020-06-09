## Landing page for Project Koku (hosted on GitHub Pages)

### Run it locally

To run it locally on your machine:
 - Install `Docker` and `git`
 - clone this repository
  
    ```sh
    git clone https://github.com/project-koku/project-koku.github.io.git
    ```

 - Change directory to `project-koku.github.io.git`

   ```sh
   cd project-koku.github.io.git
   ```

 - Build the container image by executing

   ```sh
   docker build -t koku-project .
   ```

 - Run the container

   ```sh
   docker run --rm -d -p 4000:4000 koku-project
   ```
 - Open your browser and visit `localhost:4000`
