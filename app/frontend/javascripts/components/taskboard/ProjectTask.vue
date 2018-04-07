<template>
  <a class="project-line-list-item">
    <div class="project-line-list-item-detail">
      {{ task.content }}<br />
      <div class="project-line-list-item-badges">
        <span class="fa fa-edit project-line-list-item-badge"></span>
        <span @click.prevent="callDeleteTask"
              class="fa fa-trash project-line-list-item-badge"></span>
      </div>
    </div>
  </a>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  props: {
    task: Object
  },
  methods: {
    callDeleteTask() {
      this.deleteTask(this.task);
    },
    ...mapActions(['deleteTask'])
  },
}
</script>
