<template>
  <div class="task-form">
    <form v-if="isOpenForm" @submit.prevent="onSubmit">
      <div class="siimple-form-field" style="text-align: center;">
        <textarea class="siimple-textarea siimple-textarea--fluid task-textarea"
                  placeholder="タスクを入力してください"></textarea>
      </div>

      <a @click.prevent="toggleForm" class="task-cancel">キャンセル</a>
      <button type="submit"
              class="siimple-btn siimple-btn--blue"
              style="float: right">追加</button>
    </form>

    <a v-else @click.prevent="toggleForm" class="project-line-add-link">タスク追加</a>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isOpenForm: false,
    }
  },
  methods: {
    toggleForm() {
      this.isOpenForm = !this.isOpenForm;
    },
    onSubmit() {
      alert('submit');
    }
  }
}
</script>
