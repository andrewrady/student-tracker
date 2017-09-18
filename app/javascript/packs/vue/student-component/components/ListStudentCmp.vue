<template>
    <div>
        <div v-if="students.length == 0">No students</div>
        <table v-if="students.length > 0" class="ui basic table">
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
                    <td class='age_row'>{{ student.age }}</td>
                    <td class='address_row'>{{ student.address }}</td>
                    <td class='phone_row'>{{ student.phone }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
    name: 'ActiveStudent',
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

