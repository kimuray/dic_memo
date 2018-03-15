<template>
<div class="menu" :class="{ active: isActive }">
  <ul class="menu-list">
    <a href="#">
      <li class="menu-list-item">
        Link1
      </li>
    </a>
    <a href="#">
      <li class="menu-list-item">
        Link2
      </li>
    </a>
  </ul>
</div>
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
    }
  }
}
</script>
