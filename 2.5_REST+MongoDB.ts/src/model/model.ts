import { Schema, model } from 'mongoose';


const mySchema = new Schema({

    login: { type: String, required: true },
    pass: { type: String, required: true },
    items: [{
        text: { type: String, required: true },
        checked: { type: Boolean, required: false }
    },
    ]
})

mySchema.methods.addItem = async function (text:string) {
    this.items.push({ text })
    await this.save()
    const item_id = this.items[this["items"].length - 1]._id.toString();
    return item_id;
}

mySchema.methods.updateItem = async function (text:string, checked:boolean, _id:string|number) {
    this.items = this.items.map((item:any) => {
        if (item._id.toString() === _id) {
            item = { text, checked }
        }
        return item;
    });
    await this.save();
}

mySchema.methods.delItem = async function (_id:string|number) {
    this.items = this.items.filter((item:any) => {
        if (item._id.toString() !== _id) {
            return item;
        }

    });

    await this.save();
}


export default model('UserSchema', mySchema)