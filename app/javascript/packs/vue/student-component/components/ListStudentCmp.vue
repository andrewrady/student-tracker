<template>
    <div>
        <div class="student-list">
            <div class="ui top attached header" @click="toggleContent">
                <div class="ui grid">
                    <div class="four wide column">
                        {{ student.name }}
                    </div>
                    <div class="four wide column">
                        <p>{{ student.rank }}</p>
                    </div>
                    <div class="two wide column">
                        <p>{{ student.size }}</p>
                    </div>
                    <div class="two wide column">
                        <p>{{ student.age }}</p>
                    </div>
                    <div class="one wide column right">
                        <p>K4K</p>
                    </div>
                </div>
            </div>
            <div v-if='content' class="ui attached segment">
                <div class="ui grid">
                    <div class="six wide column">
                        <address>Address: {{ student.address }}</address>
                    </div>
                    <div class="three wide column">
                        <p>Size: {{ student.size }}</p>
                    </div>
                    <div class="four wide column">
                        <p>Phone: {{ student.phone }}</p>
                    </div>
                    <div class="three wide column">
                        <a href="http://localhost.com/students/1">
                            <i class="edit icon"></i>
                        </a>
                        <i class="trash icon" @click="deleteStudent(student.id)"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
    name: 'ActiveStudent',
    props: ['student'],
    data() {
        return {
            content: false
        }
    },
    methods: {
        toggleContent() {
            this.content = !this.content;
        },
        deleteStudent(id) {
            alert('Are you sure you want to delete this student?');
            this.$store.dispatch('deleteStudent', id);
        }
    }
}
</script>