function showCategories() {
    document.getElementById("modal").classList.remove("hidden");
    document.getElementById("modal").classList.add("flex");
    document.body.style.overflow = 'hidden'; 
  }

  function hideCategories() {
    document.getElementById("modal").classList.remove("flex");
    document.getElementById("modal").classList.add("hidden");
    document.body.style.overflow = 'auto'; 
  }

  document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
      hideCategories();
    }
  });

  let selectedCategories = [];

  function toggleCategory(category, button) {
    const index = selectedCategories.indexOf(category);
    
    // Add category if not already selected
    if (index === -1) {
      selectedCategories.push(category);
      button.classList.add("bg-[#3B81F6]");
      button.classList.remove("bg-[#e9ecef]");
    } else {
      // Remove category if already selected
      selectedCategories.splice(index, 1);
      button.classList.add("bg-[#e9ecef]");
      button.classList.remove("bg-[#3B81F6]");
    }

    // Update the selected categories display
    updateSelectedCategoriesDisplay();
  }

  function updateSelectedCategoriesDisplay() {
    const selectedContainer = document.getElementById("selected-categories");
    selectedContainer.innerHTML = ''; // Clear current selections

    selectedCategories.forEach(category => {
      const tagButton = document.createElement("button");
      tagButton.className = "bg-[#3B81F6] rounded-xl px-2 text-xs lg:text-base hover:opacity-90";
      tagButton.textContent = category;

      // Remove category on click
      tagButton.onclick = function() {
        const index = selectedCategories.indexOf(category);
        if (index !== -1) {
          selectedCategories.splice(index, 1);
          updateSelectedCategoriesDisplay();
        }
      };

      selectedContainer.appendChild(tagButton);
    });
  }