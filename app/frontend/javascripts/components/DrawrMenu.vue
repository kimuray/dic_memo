<template>
  <transition name="drower">
    <div class="menu" :class="{ active: isActive }">
      <ul class="menu-list">
        <li>
          <a class="menu-close-btn" @click.prevent="closeMenu"></a>
        </li>
        <li class="menu-list-item">
          <a href="#" class="menu-list-item-link">
            Link1
          </a>
        </li>
        <li class="menu-list-item">
          <a href="#" class="menu-list-item-link">
            Link2
          </a>
        </li>
      </ul>
    </div>
  </transition>
</template>

<script>
export default {
  props: {
    isActive: Boolean,
  },
  created() {
    window.addEventListener('resize', this.setWindowHeight, false)
  },
  mounted() {
    this.setWindowHeight();
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.setWindowHeight, false)
  },
  methods: {
    setWindowHeight() {
      this.$el.style.height = `${window.innerHeight}px`;
    },
    closeMenu() {
      this.$emit('close');
    }
  }
}
</script>
