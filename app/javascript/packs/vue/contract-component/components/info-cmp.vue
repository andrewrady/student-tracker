<template>
    <div>
        <div class="ui styled accordion contract-tile" @click.stop.prevent @click="toggleContent">
            <div v-if="showContent" class="content" @click.stop.prevent>
                <p>header</p>
            </div>
            <div class="title">
                <div class="ui grid">
                    <div class="four wide column contract-name">
                        <h4>{{ contract.name }}</h4>
                    </div>
                    <div class="three wide column">
                        <p class="ui left">Start Date: 10/21/2018</p>
                    </div>
                    <div class="three wide column">
                        <p class="ui right">End Date: 11/01/2019</p>
                    </div>
                    <div class="three wide column">
                        <p v-if="contract.students.length > 0">students: <br>{{ contract.students.length }}</p>
                    </div>
                    <div class="two wide column">
                        <i class="icon edit" @click.stop.prevent @click="editContract"></i>
                        <i class="icon trash" @click.stop.prevent @click="deleteContract(contract.id)"></i>
                    </div>
                </div>
            </div>
            <div v-if="showContent" class="content" @click.stop.prevent>
                <div class="ui grid">
                    <div class="three wide column contract-name">
                        <h5>Amount: ${{ contract.amount }}</h5>
                    </div>
                    <div class="nine wide column">
                        <h5>Students under this contract</h5>
                    </div>
                    <div class="two wide column">
                        <i class="icon plus"></i>
                    </div>
                </div>
                <div class="ui divider"></div>
                <div v-for="(student, index) in contract.students" :key="index">
                    <div class="ui grid">
                        <div class="three wide column contract-name">
                            <h5>{{ student.name }}</h5>
                        </div>
                        <div class="five wide column">
                            <address>Address: {{ student.address }}</address>
                        </div>
                        <div class="four wide column">
                            <p>Rank: {{ student.rank }}</p>
                        </div>
                        <div class="two wide column">
                            <i class="icon edit" @click.stop.prevent @click="editStudent"></i>
                            <i class="icon trash"></i>
                        </div>
                        <div class="three wide column contract-name">
                            <p>Age: {{ student.age }}</p>
                        </div>
                        <div class="five wide column">
                            <p>{{ student.city }}, {{ student.state }}</p>
                        </div>
                        <div class="four wide column">
                            <p>Size: {{ student.size }}</p>
                        </div>
                    </div>
                    <div class="ui divider"></div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'info-component',
    props: ['contract'],
    data() {
        return {
            showContent: false
        }
    },
    methods: {
        toggleContent() {
            this.showContent = !this.showContent;
        },
        editContract() {
            alert('edit student');
        },
        deleteContract(id) {
            if(confirm('You are about to delete this contract')) {
                this.$store.dispatch('deleteContract', id)
            }
        },
        editStudent() {
            alert('For the horde!');
        }
    }

}
</script>