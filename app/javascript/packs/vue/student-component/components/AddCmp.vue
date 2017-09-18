<template>
  <div class="ui dimmer modals page transition visible active">
    <div class="ui modal form">
        <div class="header">
                <h1>Add Student</h1>
                <i class="remove icon" @click="closeAdd"></i>
        </div>
        <div class="content">
            <p>Step 1</p>
            <label>Name</label>
            <input type="text" placeholder="Name">
            <label>Address</label>
            <input type="text" placeholder="Address">
            <label>Phone Number</label>
            <input type="text" placeholder="Number">
        </div>
        <div class="footer">
            <button class="positive ui button">Next Step</button>
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
