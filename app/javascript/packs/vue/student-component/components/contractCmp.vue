<template>
    <div class="ui modal form add-modal">
        <div class="header">
            <h1>Add Head of House</h1>
            <i class="remove icon" @click="closeContract"></i>
        </div>
        <div class="content content-form">
            <label>Full Name</label>
            <input type="text" v-model="name">
            <label>Amount</label>
            <input type="number" v-model="amount">
        </div>
        <div class="footer">
                <button class="ui primary basic button" @click="addContract">Add</button>
            </div>
    </div>
</template>

<script>
export default {
    name: 'headOfHouse',
    props: ['userId'],
    data() {
        return {
            name: '',
            amount: '',
        }
    },
    methods: {
        closeContract(){
            this.$store.commit('toggleContract', false);
            this.$store.commit('toggleShow', true);
        },
        addContract() {
            this.$store.dispatch('addContracts', {'name': this.name, 'amount': this.amount, 'user_id': this.userId});
        }
    }
}
</script>
