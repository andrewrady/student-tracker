<template>
  <div>
    <div >
      <transition class="slide">
        <add-cmp v-if="showAdd"></add-cmp>
      </transition>
    </div>
    <div class="ui bottom attached segment">
      <div class="add" @click="toggleAdd">
        Add
        <i class="plus icon"></i>
      </div>
      <div class="ui grid">
        <div class="four wide column">
          <h4>Name</h4>
        </div>
        <div class="four wide column">
          <h4>Rank</h4>
        </div>
        <div class="two wide column">
          <h4>Size</h4>
        </div>
        <div class="two wide column">
          <h4>Age</h4>
        </div>
        <div class="three wide column">
          <h4>Program</h4>
        </div>
      </div>
      <div v-if="students.length == 0">No students</div>
      <div v-if="students.length > 0">
        <active-cmp v-for='(student, index) in students' :key='index' :student="student"></active-cmp>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import AddCmp from './components/AddCmp.vue';
import ActiveCmp from './components/ListStudentCmp.vue';

export default {
  name: 'app',
  components: {
    AddCmp,
    ActiveCmp
  },
  computed: {
    ...mapState([
      'showAdd',
      'showContact',
      'students'
    ])
  },
  mounted() {
    this.$store.dispatch('populateStudents')
  },
  methods: {
    toggleAdd() {
      this.$store.commit('toggleShow', true)
    }
  }
}
</script>