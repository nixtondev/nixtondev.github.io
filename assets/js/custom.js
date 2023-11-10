        var copy = "&copy;";
        var author = " nixton.dev ";

        function getCopy(year){
  
        document.write(copy);
        document.write(author);
        document.write(year, ' - ');
        document.write(new Date().getFullYear());
  
        }

        const darkModeToggle = document.getElementById("darkModeToggle");
        const body = document.body;

        if (localStorage.getItem("darkMode") === "enabled") {
            enableDarkMode();
        }

        darkModeToggle.addEventListener("click", () => {
            if (body.classList.contains("dark-mode")) {
                disableDarkMode();
            } else {
                enableDarkMode();
            }
        });

        function enableDarkMode() {
            body.classList.add("dark-mode");
            localStorage.setItem("darkMode", "enabled");
        }

        function disableDarkMode() {
            body.classList.remove("dark-mode");
            localStorage.setItem("darkMode", "disabled");
        }