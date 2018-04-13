<template>
  <a class="project-line-list-item">
    <form v-if="isEdit" @submit.prevent="callUpdateTask">
      <div class="siimple-form-field">
        <textarea v-model="tmpContent"
                  class="siimple-textarea task-textarea"></textarea>
      </div>

      <div class="task-menu">
        <a @click.prevent="toggleEditForm" class="task-cancel">キャンセル</a>
        <button type="submit" class="siimple-btn siimple-btn--blue">更新</button>
      </div>
    </form>

    <div v-else class="project-line-list-item-detail">
      {{ task.content }}<br />
      <div class="project-line-list-item-badges">
        <span @click.prevent="toggleEditForm"
              class="fa fa-edit project-line-list-item-badge"></span>
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
  data() {
    return {
      isEdit: false,
      tmpContent: this.task.content,
    }
  },
  methods: {
    callDeleteTask() {
      this.deleteTask(this.task);
    },
    callUpdateTask() {
      this.task.tmpContent = this.tmpContent;
      this.updateTask(this.task);
      this.clearForm();
    },
    toggleEditForm() {
      this.isEdit = !this.isEdit;
    },
    clearForm() {
      this.tmpContent = '';
      this.toggleEditForm();
    },
    ...mapActions(['deleteTask', 'updateTask'])
  },
}
</script>
