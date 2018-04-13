<template>
  <div class="project">
    <div class="project-board">
      <div class="project-line" v-for="line in project">
        <div class="project-line-container">
          <div class="project-line-title">
            <h3 class="project-line-title-text">{{ line.name }}</h3>
          </div>

          <div class="project-line-list">
            <draggable :options="options" v-for="task in line.tasks">
              <ProjectTask :task="task" />
            </draggable>
          </div>
          <AddTaskForm :lineId="line.id" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import draggable from 'vuedraggable';
import ProjectTask from './ProjectTask.vue';
import AddTaskForm from './AddTaskForm';
import store from '../../store/taskboard';
import { mapState } from 'vuex';

export default {
  store,
  components: {
    draggable,
    ProjectTask,
    AddTaskForm,
  },
  computed: {
    ...mapState(['project'])
  },
  data() {
    return {
      options: {
        group: 'project',
        animation: 100,
      },
    }
  },
}
</script>
