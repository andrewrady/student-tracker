<template>
    <div>
      <div class="ui bottom attached segment">
        <div class="right">
          Add
          <i class="plus icon"></i>
        </div>
        <table class="ui basic table">
          <thead>
            <tr>
              <th>Student</th>
              <th class='rank_row'>Rank</th>
              <th class='size_row'>Size</th>
              <th class='age_row'>Age</th>
              <th class='address_row'>Address</th>
              <th class='phone_row'>Phone</th>
            </tr>
          </thead>
          <tbody>
              <tr v-for='(student, index) in students' :key='index'>
                <td>{{ student.name }}</td>
                <td class='rank_row'>{{ student.rank }}</td>
                <td class='size_row'>{{ student.size }}</td>
                <td class='age_row'>{{ studentage }}</td>
                <td class='address_row'>{{ student.address }}</td>
                <td class='phone_row'>{{ student.phone }}</td>
              </tr>
          </tbody>
        </table>
      </div>
    </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
    name: 'app',
    data() {
        return {
            
        }
    },
    mounted() {
      this.$store.dispatch('populateStudents')
    },
    computed: {
      ...mapState([
        'students'
      ])
    }
}
</script>
