<template>
    <div class="ui dimmer modals page transition visible active">
        <div class="ui modal form">
            <div class="header">
                <h1>Add Student</h1>
                <i class="remove icon" @click="closeAdd"></i>
            </div>
            <div class="content" v-if="step == 1">
                <p>Step 1</p>
                <label>Name</label>
                <input type="text" placeholder="Name" v-model="name">
                <label>Address</label>
                <input type="text" placeholder="Address" v-model="address">
                <label>City</label>
                <input type="text" placeholder="City" v-model="city">
                <label>Zip</label>
                <input type="text" placeholder="Zip" v-model="zip">
                <label>Phone Number</label>
                <input type="text" placeholder="Number" v-model="number">
            </div>
            <div class="content" v-if="step == 2">
                <p>Step 2</p>
                <label>Rank</label>
                <input type="text" placeholder="White" v-model="rank">
                <label>Size</label>
                <input type="text" placeholder="1" v-model="size">
                <label>Gender</label>
                <select v-model="gender">
                    <option value="male">Male</option>
                    <option value="femal">Female</option>
                </select>
                <label>Email</label>
                <input type="email" placeholder="Email" v-model="email">
            </div>
            <div class="content" v-if="step == 3">
                
            </div>
            <div class="footer">
                <button class="negative ui button" @click="decrementStep" v-if="step > 1">Previous Step</button>
                <button class="positive ui button" @click="incrementStep" v-if="step < 3">Next Step</button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'AddStudent',
    props: ['addStatus'],
    data() {
        return {
            step: 1,
            name: '',
            address: '',
            city: '',
            zip: '',
            number: '',
            rank: '',
            size: '',
            gender: '',
            email: ''
        }
    },
    methods: {
        closeAdd() {
            this.$store.commit('toggleShow', false);
        },
        incrementStep() {
            if(this.step < 3) {
                this.step ++;
            }
        },
        decrementStep() {
            if(this.step > 1) {
                this.step --;
            }
        }
    }
}
</script>
