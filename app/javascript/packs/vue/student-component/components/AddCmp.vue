<template>
  <div class="ui dimmer modals page transition visible active">
    <div class="ui modal">
        <div class="header">
            <h1>Create Student</h1>
            <i class="remove icon" @click="closeAdd"></i>
        </div>
    </div>
  </div>
</template>

<script>
export default {
    name: 'AddStudent',
    props: [ 'addStatus'],
    methods: {
        closeAdd() {
            this.$store.commit('toggleShow', false);
        }
    }
}
</script>
