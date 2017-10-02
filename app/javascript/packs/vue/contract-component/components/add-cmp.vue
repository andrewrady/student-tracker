<template>
    <div class="ui form add-contract">
        <div class="ui dividing header">
            <h1 class="left">Add Contract</h1>
            <i class="icon remove red right" @click="closeAdd"></i>
        </div>
        <div class="field">
            <input type="text" placeholder="Name" v-model="name">
        </div>
        <div class="two fields">
            <div class="field">
                <label>Amount</label>
                <input type="text" placeholder="Amount" v-model="amount">
            </div>
            <div class="field">
                <label>Payment Date</label>
                <input type="date" v-model="payment">
            </div>
        </div>
        <div class="two fields">
            <div class="field">
                <label>Start Date</label>
                <input type="date" v-model="start">
            </div>
            <div class="field">
                <label>End Date</label>
                <input type="date" v-model="end">
            </div>
        </div>
        <button class="ui primary basic button" @click="create">Add</button>
    </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
    name: 'add-contract',
    data() {
        return {
            name: '',
            amount: '',
            start: '',
            end: '',
            payment: ''
        }
    },
    computed: {
        ...mapState([
            'userId'
        ])
    },
    methods: {
        closeAdd() {
            this.$store.commit('toggleAdd', false);
        },
        create() {
            const startDate = (this.start != '' ? new Date(this.start).toISOString() : '');
            const endDate = (this.start != '' ? new Date(this.start).toISOString() : '');

            if(!startDate) {
                alert('You need to enter a start date');
            } else {
                alert(startDate);
            }
            // this.$store.dispatch('addContract', { 'name': this.name, 'user_id': this.userId });
        }
    }

}
</script>