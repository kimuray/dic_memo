<template>
  <div class="task-form">
    <form v-if="isOpenForm" @submit.prevent="onSubmit">
      <div class="siimple-form-field" style="text-align: center;">
        <textarea v-model="content"
                  class="siimple-textarea task-textarea bg-white"
                  placeholder="タスクを入力してください"></textarea>
      </div>

      <div class="task-menu">
        <a @click.prevent="toggleForm" class="task-cancel">キャンセル</a>
        <button type="submit"
                class="siimple-btn siimple-btn--blue">追加</button>
      </div>
    </form>

    <a v-else @click.prevent="toggleForm" class="project-line-add-link">タスク追加</a>
  </div>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  props: {
    lineId: Number,
  },
  data() {
    return {
      isOpenForm: false,
      content: '',
    }
  },
  methods: {
    toggleForm() {
      this.isOpenForm = !this.isOpenForm;
    },
    onSubmit() {
      const task = {
        lineId: this.lineId,
        content: this.content,
      }
      this.addTask(task);
      this.clearForm();
    },
    clearForm() {
      this.content = '';
      this.toggleForm();
    },
    ...mapActions(['addTask'])
  },
}
</script>
