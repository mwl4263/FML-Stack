window.onload = function() {
    document.getElementById("deleteButton").onclick = function() {
        if (document.getElementById("deleteButton").classList.contains("active")) {
            document.getElementById("deleteButton").classList.remove("active");
            document.getElementById("actionHead").classList.add("d-none")
            var x = document.querySelectorAll(".actionCol");
            x.forEach((element) => {
                element.classList.add("d-none");
            });
        } else {
            document.getElementById("deleteButton").classList.add("active");
            document.getElementById("actionHead").classList.remove("d-none");
            var x = document.querySelectorAll(".actionCol")
            x.forEach(element => {
                element.classList.remove("d-none");
            });
        }
    }
}