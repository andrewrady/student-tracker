<template>
    <div class="ui grid">
        <div class="row">
            <div class="eleven wide column">
                <div class="ui top attached tabular menu">
                    <a class="item active">
                        Active List
                    </a>
                </div>
                <div class="ui bottom attached active tab segment contract">
                    <info-cmp v-for="(contract,index) in contracts" :key="index" :contract="contract"></info-cmp>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex';
import infoCmp from './components/info-cmp.vue';

export default {
    name: 'Contract-Component',
    components: {
        infoCmp
    },
    computed: {
        ...mapState([
            'contracts'
        ])
    },
    mounted() {
        this.$store.dispatch('populateContracts');
    }
}
</script>