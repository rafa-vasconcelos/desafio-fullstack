let Hooks = {};

Hooks.ImageLoader = {
  mounted() {
    const imageUrl = this.el.dataset.imageUrl;
    const img = new Image();

    // Listen for the image's onload event
    img.onload = () => {
      this.pushEvent("image_loaded");
    };

    // Start loading the image
    img.src = imageUrl;
  },

  updated() {
    const imageUrl = this.el.dataset.imageUrl;
    const img = new Image();

    // Listen for the image's onload event after updates
    img.onload = () => {
      this.pushEvent("image_loaded");
    };

    // Start loading the image
    img.src = imageUrl;
  },
};

export default Hooks;
