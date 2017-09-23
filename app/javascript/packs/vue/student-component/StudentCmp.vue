<template>
    <div>
      <div v-if="showAdd">
        <add-cmp ></add-cmp>
      </div>
      <div class="ui bottom attached segment">
        <div class="add" @click="toggleAdd">
          Add
          <i class="plus icon"></i>
        </div>
        <active-cmp></active-cmp>
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
      ])
    },
    methods: {
      toggleAdd() {
        this.$store.commit('toggleShow', true)
      }
    }
}
</script>